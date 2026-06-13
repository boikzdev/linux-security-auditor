from python.analyzer import risk_score



def test_risk_score():


    findings=[

    {
    "severity":"HIGH"
    },


    {
    "severity":"MEDIUM"
    }

    ]


    assert risk_score(findings)==15
