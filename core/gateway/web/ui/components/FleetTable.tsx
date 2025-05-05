import { useState } from 'react'
import useSWR from 'swr'
import { Card } from '@/components/ui/card'
type Node={id:string;vram:number;temp:number;uptime:number;earnings:number}
export default function FleetTable(){
  const {data:nodes}=useSWR<Node[]>('/api/fleet')
  const [sort,setSort]=useState<keyof Node>('temp')
  const [filter,setFilter]=useState('')
  const filtered=(nodes||[]).filter(n=>n.id.toLowerCase().includes(filter.toLowerCase()))
  const sorted=[...filtered].sort((a,b)=>a[sort]>b[sort]?-1:1)
  return(<Card className='p-4 overflow-x-auto'>
    <input placeholder='Search…' className='input mb-3 w-full md:w-1/3' onChange={e=>setFilter(e.target.value)} />
    <table className='min-w-full text-sm'>
      <thead><tr>{(['id','vram','temp','uptime','earnings'] as (keyof Node)[]).map(k=><th key={k} onClick={()=>setSort(k)} className='cursor-pointer hover:underline px-2 py-1 text-left'>{k.toUpperCase()}</th>)}</tr></thead>
      <tbody>{sorted.map(n=><tr key={n.id} className='border-b last:border-none'>
        <td className='px-2 py-1'>{n.id.slice(0,6)}</td>
        <td className='px-2 py-1'>{n.vram} MB</td>
        <td className={`px-2 py-1 ${n.temp>80?'text-red-500':''}`}>{n.temp} °C</td>
        <td className='px-2 py-1'>{(n.uptime/3600).toFixed(1)} h</td>
        <td className='px-2 py-1'>${n.earnings.toFixed(2)}</td></tr>)}</tbody></table></Card>)
}
