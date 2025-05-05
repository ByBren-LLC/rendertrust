import http from 'k6/http';
import { check, sleep } from 'k6';
export const options={vus:1000,duration:'1m',thresholds:{http_req_failed:['rate<0.01'],http_req_duration:['p(95)<300']}};
export default function(){const payload=JSON.stringify({script_id:`s${__VU}${__ITER}`,prompts:[{id:1,text_prompt:'INT. SPACE STATION – DAY'}]});const res=http.post('http://localhost:8080/api/submit',payload,{headers:{'Content-Type':'application/json'}});check(res,{'status 200':r=>r.status===200});sleep(1);}