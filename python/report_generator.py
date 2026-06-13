import json
import argparse
from datetime import datetime


parser = argparse.ArgumentParser()


parser.add_argument(
"--audit-results",
default="audit_results.json"
)

parser.add_argument(
"--output",
default="report.html"
)


args = parser.parse_args()



with open(args.audit_results) as f:

    data=json.load(f)



html=f"""

<html>

<head>

<title>
Linux Security Audit Report
</title>


<style>

body {{
font-family:Arial;
padding:30px;
}}

.high {{
color:red;
}}

.medium {{
color:orange;
}}

</style>


</head>



<body>


<h1>
Linux Security Audit Report
</h1>


<p>
Generated:
{datetime.now()}
</p>



<h2>
Results
</h2>


<pre>

{json.dumps(data,indent=4)}

</pre>


</body>

</html>

"""



with open(args.output,"w") as f:

    f.write(html)



print(
"[+] Report generated:",
args.output
)
