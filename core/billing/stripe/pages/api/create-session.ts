import { NextApiRequest, NextApiResponse } from 'next'
import Stripe from 'stripe'
const stripe = new Stripe(process.env.STRIPE_SECRET!, { apiVersion: '2023-10-16' })
export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  const { sku } = req.body
  const session = await stripe.checkout.sessions.create({
    mode: 'payment',
    line_items: [{ price: process.env[`PRICE_${sku.toUpperCase()}`]!, quantity: 1 }],
    success_url: `${process.env.NEXT_PUBLIC_BASE}/success?session={CHECKOUT_SESSION_ID}`,
    cancel_url: `${process.env.NEXT_PUBLIC_BASE}/credits`,
    client_reference_id: req.headers['x-user-id'] as string,
  })
  res.json({ url: session.url })
}
