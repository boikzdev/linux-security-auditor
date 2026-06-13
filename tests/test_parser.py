from python.log_parser import LogParser



def test_parser(tmp_path):


    file=tmp_path/"auth.log"



    file.write_text(

    "Failed password from 1.2.3.4"

    )



    parser=LogParser(file)



    assert len(
    parser.failed_logins()
    )==1
