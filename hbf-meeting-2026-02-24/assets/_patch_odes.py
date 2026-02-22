"""Add ODE equations + parameter values text box to both the interactive widget and GIF cells."""
import json

NB_PATH = "HBF-20260224-computational-consciousness-in-LLMs.ipynb"

with open(NB_PATH) as f:
    nb = json.load(f)

# The ODE + param text block (template — alpha/beta/gamma/delta are f-string vars)
ODE_PARAM_TEXT = (
    r"dp/dt = α·s − β·p"  "\n"
    r"e(t)  = s − p"       "\n"
    r"dc/dt = γ·|e| − δ·c" "\n"
    "─────────────\n"
    "α = {alpha:.1f}   β = {beta:.1f}\n"
    "γ = {gamma:.1f}   δ = {delta:.1f}\n"
    "γ/δ = {gd:.1f}"
)

# ── Cell 33: Interactive widget ───────────────────────────────────────────────

cell33 = nb["cells"][33]
src = "".join(cell33["source"])

# Insert a fig.text annotation right before the time-series panel
OLD_TS = "        # Time-series panel (bottom portion)"

NEW_TS = (
    "        _ode_text = (\"dp/dt = \\u03b1\\u00b7s \\u2212 \\u03b2\\u00b7p\\n\"\n"
    "                     \"e(t)  = s \\u2212 p\\n\"\n"
    "                     \"dc/dt = \\u03b3\\u00b7|e| \\u2212 \\u03b4\\u00b7c\\n\"\n"
    "                     \"\\u2500\" * 13 + \"\\n\"\n"
    "                     f\"\\u03b1 = {alpha:.1f}   \\u03b2 = {beta:.1f}\\n\"\n"
    "                     f\"\\u03b3 = {gamma:.1f}   \\u03b4 = {delta:.1f}\\n\"\n"
    "                     f\"\\u03b3/\\u03b4 = {gamma/delta:.1f}\")\n"
    "        fig.text(0.01, 0.42, _ode_text, fontsize=7, fontfamily='monospace',\n"
    "                 va='top', ha='left',\n"
    "                 bbox=dict(boxstyle='round,pad=0.4', facecolor='#f0f0f0',\n"
    "                           edgecolor='#999', alpha=0.9))\n"
    "\n"
    "        # Time-series panel (bottom portion)"
)

assert OLD_TS in src, "Cell 33: marker not found!"
src = src.replace(OLD_TS, NEW_TS)

cell33["source"] = [line + "\n" for line in src.split("\n")]
if cell33["source"][-1] == "\n":
    cell33["source"][-1] = ""

# ── Cell 38: GIF generation ──────────────────────────────────────────────────

cell38 = nb["cells"][38]
src38 = "".join(cell38["source"])

# Replace the existing param_text with ODE + param text
OLD_PARAM = (
    '    param_text = (f"α = {alpha:.1f}   β = {beta:.1f}\\n"\n'
    '                  f"γ = {gamma:.1f}   δ = {delta:.1f}\\n"\n'
    '                  f"γ/δ = {gamma/delta:.1f}")'
)

NEW_PARAM = (
    '    param_text = ("dp/dt = \\u03b1\\u00b7s \\u2212 \\u03b2\\u00b7p\\n"\n'
    '                  "e(t)  = s \\u2212 p\\n"\n'
    '                  "dc/dt = \\u03b3\\u00b7|e| \\u2212 \\u03b4\\u00b7c\\n"\n'
    '                  "\\u2500" * 13 + "\\n"\n'
    '                  f"\\u03b1 = {alpha:.1f}   \\u03b2 = {beta:.1f}\\n"\n'
    '                  f"\\u03b3 = {gamma:.1f}   \\u03b4 = {delta:.1f}\\n"\n'
    '                  f"\\u03b3/\\u03b4 = {gamma/delta:.1f}")'
)

assert OLD_PARAM in src38, f"Cell 38: OLD_PARAM not found!"
src38 = src38.replace(OLD_PARAM, NEW_PARAM)

cell38["source"] = [line + "\n" for line in src38.split("\n")]
if cell38["source"][-1] == "\n":
    cell38["source"][-1] = ""

# ── Save ──────────────────────────────────────────────────────────────────────

with open(NB_PATH, "w") as f:
    json.dump(nb, f, indent=1, ensure_ascii=False)

print("Patch applied successfully.")
print("  Cell 33: added ODE + parameter text box to interactive widget")
print("  Cell 38: expanded param_text to include ODE equations")
