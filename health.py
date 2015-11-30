#!/usr/bin/python


import urllib, httplib2, json, sys, os

sys.exit(0)
try:
    # health_url = 'http://localhost:8080/api/health'
    
    h = httplib2.Http()
    
    resp, content = h.request(sys.argv[1], "GET")

    
    #print resp
    #print content
    
    if resp['status'] != "200":
        sys.exit(2)
    

    data = json.loads(content)
    

    if data['status'].upper() == "UP":
        sys.exit(0)
    elif data['status'].upper() == "WARN":
        sys.exit(1)
    else:
        sys.exit(2)

except Exception:
    sys.exit(2)
