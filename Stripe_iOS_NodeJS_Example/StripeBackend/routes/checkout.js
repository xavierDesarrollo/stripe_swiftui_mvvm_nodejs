var express = require('express');
var router = express.Router();
const Stripe = require('stripe');
require('dotenv').config();

router.get('/:amount', async function(req, res, next) {
  console.log(process.env.PUBLISHABLE_KEY)

  const amount = req.params.amount

  const stripe = Stripe(process.env.SECRET_KEY);

  var customer = await stripe.customers.retrieve('cus_QnMOUyqHI6rCFt');
  console.log(customer)

  const ephemeralKey = await stripe.ephemeralKeys.create(
    {customer: customer.id},
    {apiVersion: '2024-06-20'}
  );  
    
  const paymentIntent = await stripe.paymentIntents.create({
    amount: amount,
    currency: "usd",
    customer: customer.id,
    payment_method_types: [
      'card'
    ],
  });

  res.send({
    publishableKey: process.env.PUBLISHABLE_KEY, 
    paymentIntent: paymentIntent.client_secret,
    customer: customer.id,
    ephemeralKey: ephemeralKey.secret
  });
});

module.exports = router;
