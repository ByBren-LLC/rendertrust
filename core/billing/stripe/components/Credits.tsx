
const tiers=[{id:'cred10',label:'$10 / 100 credits'},{id:'cred50',label:'$50 / 550 credits'}]
export default function Credits(){
  const buy=async(sku:string)=>{
    const r=await fetch('/api/create-session',{method:'POST',body:JSON.stringify({sku}),headers:{'Content-Type':'application/json'}})
    const {url}=await r.json(); window.location.href=url;
  }
  return <div className="flex flex-col gap-4">{tiers.map(t=><button key={t.id} onClick={()=>buy(t.id)} className="btn-primary">{t.label}</button>)}</div>
}
