from collections import Counter



def analyze_failed_logins(entries):


    ips=[]


    for e in entries:


        parts=e.split()


        if len(parts)>10:

            ips.append(parts[-4])



    return Counter(ips)



def risk_score(findings):


    score=0


    for f in findings:


        if f["severity"]=="HIGH":

            score+=10


        elif f["severity"]=="MEDIUM":

            score+=5



    return score


