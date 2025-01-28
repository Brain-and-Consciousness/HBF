# Analysis (HBF-meeting-20250128) cf. shiny-app.R

# Import libraries
import streamlit as st
import pandas as pd
import numpy as np
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots

# Run the streamlit app:
#  streamlit run app.py

# Set page config
st.set_page_config(page_title="Essay Topic Analysis", layout="wide")

# Function to load and prepare data
@st.cache_data
def load_data():
    # Read the CSV files
    data = pd.read_csv('./prepared-data.csv')
    essay_topics = pd.read_csv('essay-topics.csv')
    
    # Convert date columns to datetime
    data['start_date'] = pd.to_datetime(data['start_date'])
    data['end_date'] = pd.to_datetime(data['end_date'])
    
    return data, essay_topics

# Load data
try:
    data, essay_topics = load_data()
except Exception as e:
    st.error(f"Error loading data: {e}")
    st.stop()

# Sidebar filters
st.sidebar.title("Filters")

# Topic selector
selected_topic = st.sidebar.selectbox(
    "Select Topic:",
    options=data['item_short'].unique(),
    index=0
)

# University selector
selected_university = st.sidebar.selectbox(
    "Select University:",
    options=['all'] + list(data['university'].unique()),
    index=0
)

# Gender selector
selected_gender = st.sidebar.selectbox(
    "Select Gender:",
    options=['all'] + list(data['gender'].unique()),
    index=0
)

# Age range slider
age_min = int(data['age'].min())
age_max = int(data['age'].max())
selected_age_range = st.sidebar.slider(
    "Age Range:",
    min_value=age_min,
    max_value=age_max,
    value=(age_min, age_max)
)

# Filter data based on selections
filtered_data = data[data['item_short'] == selected_topic]

if selected_university != 'all':
    filtered_data = filtered_data[filtered_data['university'] == selected_university]
if selected_gender != 'all':
    filtered_data = filtered_data[filtered_data['gender'] == selected_gender]

filtered_data = filtered_data[
    (filtered_data['age'] >= selected_age_range[0]) &
    (filtered_data['age'] <= selected_age_range[1])
]

# Create main layout
st.title("Essay Topic Analysis")

# Display sample size
st.write(f"Sample size: {len(filtered_data['ID'].unique())}")

# Create 2x2 grid of plots
col1, col2 = st.columns(2)

with col1:
    # Attitude histogram
    fig_attitude = px.histogram(
        filtered_data,
        x='attitude',
        nbins=9,
        title='Attitude Distribution'
    )
    fig_attitude.update_xaxes(tickvals=list(range(1, 10)))
    st.plotly_chart(fig_attitude, use_container_width=True)

    # Side proportion bar chart
    side_counts = filtered_data['side'].value_counts(normalize=True)
    fig_side = px.bar(
        x=side_counts.index,
        y=side_counts.values,
        title='Side Distribution',
        labels={'x': 'Side', 'y': 'Proportion'}
    )
    fig_side.update_traces(text=[f"{v:.1%}" for v in side_counts.values],
                          textposition='outside')
    st.plotly_chart(fig_side, use_container_width=True)

with col2:
    # Importance histogram
    fig_importance = px.histogram(
        filtered_data,
        x='importance',
        nbins=9,
        title='Importance Distribution'
    )
    fig_importance.update_xaxes(tickvals=list(range(1, 10)))
    st.plotly_chart(fig_importance, use_container_width=True)

    # Plausibility proportion bar chart
    plaus_counts = filtered_data['plausibility'].value_counts(normalize=True)
    fig_plaus = px.bar(
        x=plaus_counts.index,
        y=plaus_counts.values,
        title='Plausibility Distribution',
        labels={'x': 'Plausibility', 'y': 'Proportion'}
    )
    fig_plaus.update_traces(text=[f"{v:.1%}" for v in plaus_counts.values],
                           textposition='outside')
    st.plotly_chart(fig_plaus, use_container_width=True)

# Add Compare Labs tab
st.markdown("---")
st.header("Compare Labs")

# Controls for lab comparison
col1, col2 = st.columns([1, 2])

with col1:
    compare_topic = st.selectbox(
        "Select Topic for Comparison:",
        options=data['item_short'].unique(),
        key='compare_topic'
    )
    
    measure = st.selectbox(
        "Measure of Center:",
        options=['mean', 'median'],
        key='measure'
    )
    
    variance = st.selectbox(
        "Measure of Variance:",
        options=['none', 'standard deviation', '95% CI'],
        key='variance'
    )

# Calculate statistics for lab comparison
lab_data = data[data['item_short'] == compare_topic].groupby('university_short')

if measure == 'mean':
    center = lab_data['attitude'].mean()
    if variance == 'standard deviation':
        error = lab_data['attitude'].std()
    elif variance == '95% CI':
        error = lab_data['attitude'].agg(lambda x: 1.96 * x.std() / np.sqrt(len(x)))
else:
    center = lab_data['attitude'].median()
    error = None

# Create lab comparison plot
fig_labs = go.Figure()

fig_labs.add_trace(go.Bar(
    x=center.index,
    y=center.values,
    name=measure
))

if variance != 'none' and measure == 'mean':
    fig_labs.add_trace(go.Scatter(
        x=center.index,
        y=center.values + error.values,
        mode='lines',
        name='Upper bound',
        line=dict(width=0),
        showlegend=False
    ))
    fig_labs.add_trace(go.Scatter(
        x=center.index,
        y=center.values - error.values,
        mode='lines',
        fill='tonexty',
        name=f'{variance}',
        line=dict(width=0)
    ))

fig_labs.update_layout(
    title=f'Attitude by University ({measure})',
    xaxis_title='University',
    yaxis_title='Attitude',
    yaxis_range=[1, 9],
    yaxis_tickvals=list(range(1, 10))
)

st.plotly_chart(fig_labs, use_container_width=True)

# Display university codes and names
st.markdown("### University Codes")
uni_codes = data[['university_short', 'university']].drop_duplicates()
st.dataframe(uni_codes.rename(columns={
    'university_short': 'Code',
    'university': 'University'
}))