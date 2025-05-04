from typing import Dict
def run(payload: Dict) -> Dict:
    return {"result": payload.get("text","").upper()}
if __name__=="__main__":
    import sys, json; print(json.dumps(run(json.load(sys.stdin))))
