# stripe_swiftui_mvvm_nodejs
This is an app in swiftui and nodejs that use Stripe as a payment framework.

STRIPE
1. First create an account in Stripe here: https://dashboard.stripe.com/test/dashboard.
2. Go to the dashboard, select "Developers" option and then Api Keys.
3. Generate Publishable key and Secret key.
4. Create a Customer on the dashboard too.
5. You can use my keys and customerId for this example, no problem. There are copy on the projects.
6. More information about Stripe Docs: https://docs.stripe.com/payments
7. More information about Stripe Api: https://docs.stripe.com/api?lang=node

BACKEND NODEJS APP
1. cd StripeBackend
2. npm install
3. npm start
4. Your serve is listening on port 3000
5. If you create new Api Keys, copy/replace into .env file please
6. If you create a new customer, copy/replace the customerId into checkout.js file

iOS APP
1. Open the project
2. If the server listening port is diferent than 3000 please replace it on AppConstants.swift file
3. cmd + b and run


<img width="295" alt="Screenshot 2024-09-06 at 4 30 25 AM" src="https://github.com/user-attachments/assets/89db6034-c0d0-4ccf-b9c6-f0f97d4461d8">

<img width="307" alt="Screenshot 2024-09-06 at 4 31 26 AM" src="https://github.com/user-attachments/assets/8dbe66b4-effb-4cd0-9dc3-d428c0baf1a8">

<img width="312" alt="Screenshot 2024-09-06 at 4 31 35 AM" src="https://github.com/user-attachments/assets/41389469-3de2-4dde-9837-1c408e557356">
