import json
import argparse
from datetime import datetime

from jinja2 import Environment,FileSystemLoader



parser=argparse.ArgumentParser()



parser.add_argument(
"--audit-results",
default="audit_results.json"
)


parser.add_argument(
"--output",
default="security_report.html"
)



args=parser.parse_args()



with open(args.audit_results) as f:

    data=json.load(f)



findings=[]



for section in data.values():


    if isinstance(section,dict):

        for item in section.get(
        "checks",
        []):

            findings.append(item)



score=100-(len(findings)*5)


if score<0:

    score=0



env=Environment(
loader=FileSystemLoader(
"templates"
)
)



template=env.get_template(
"report_template.html"
)



html=template.render(

hostname=data.get(
"hostname",
"Unknown"
),

date=datetime.now(),

findings=findings,

score=score

)



with open(args.output,"w") as f:

    f.write(html)



print(
"[+] Report created:",
args.output
)
