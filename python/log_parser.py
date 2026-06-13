import re


class LogParser:


    def __init__(self,path):

        self.path=path



    def failed_logins(self):

        results=[]


        with open(self.path,errors="ignore") as f:


            for line in f:


                if "Failed password" in line:


                    results.append(line.strip())


        return results



if __name__=="__main__":


    parser=LogParser(
    "/var/log/auth.log"
    )


    for item in parser.failed_logins():

        print(item)
