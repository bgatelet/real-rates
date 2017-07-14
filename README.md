# Real Rates
Link to the [frontend  repo](https://github.com/bgatelet/real-rates-react).

This app let’s you list all currencies that will be used on your trip (based on availability) and has an input for the actual exchange rate encountered that will show how much money is gained or lost compared to official exchange rate. Check it out [here](https://dist-cwvxoggxra.now.sh/#/).

## About
__Initial idea__: a foreign exchange list for travelers with official rates that lets you easily see how much is lost with actual rates.

### Three things I wanted the app to do:
1. Find/Add currencies
2. Get value in actual exchange rate
3. See difference between official and actual rates

### Dependencies
These dependencies are both used for gathering information on rates and displaying the information (the currency’s code with the currency’s name):
- <http://fixer.io/>: used for getting up to date rates, but limited in number of currencies.
- <https://github.com/OpenBookPrices/country-data>: used for getting information on each currency code.

### Features:
- Add currencies by currency code.
- Make a list of currencies with rates that automatically update every time the app opens.
- See value of input in every currency selected.
- Change main currency to compare others.
- Remove currency from list by clicking on X.
- Insert custom exchange rates and automatically see how much money is gained or lost with the transaction.
- Save data for later with an account.

### Possible Improvements:
- Design and UX
- Allow users to create multiple lists.
- Persist unofficial rates to backend.
- Failure to persist data to the backend should undo the action.
- Give feedback on backend errors (i.e. 404).
- Build a frontend testing suite that goes beyond just checking initial state and components.
- Break up RateContainer into smaller pieces.
- Remove localhost from CORS in production.
