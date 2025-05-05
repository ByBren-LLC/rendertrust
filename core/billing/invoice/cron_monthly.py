import asyncio, os, postmarker
from invoice_builder import build, PERIOD
from db import async_session, Creator
client=postmarker.PostmarkClient(server_token=os.environ['POSTMARK_KEY'])
async def main():
    async with async_session() as s:
        rows=await s.execute('SELECT id,email FROM creators')
    for r in rows:
        url,total=await build(r.id)
        client.emails.send(From='billing@wtfb.ai',To=r.email,Subject=f'WTFB Invoice {PERIOD}',HtmlBody=f'<p>Total ${total:.2f}. <a href="{url}">Download PDF</a></p>')
asyncio.run(main())
