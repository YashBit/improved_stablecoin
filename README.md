# Better DSCEngine: Decentralized Stablecoin Engine with Dynamic Liquidation Threshold Based on Market Volatility

DSCEngine is a smart contract system for a decentralized stablecoin with dynamic collateralization features. It allows users to mint, burn, and manage a stablecoin backed by various collateral types.

## Features

- Multi-collateral support
- Minting and burning of stablecoins
- Collateral deposit and withdrawal
- Liquidation mechanism
- Dynamic liquidation threshold based on market volatility
- Health factor calculation for user positions

## Smart Contracts

- `DSCEngine.sol`: Main contract handling core functionalities
- `DecentralizedStableCoin.sol`: ERC20 token contract for the stablecoin

## Key Components

### Collateral Management
- Users can deposit multiple types of collateral tokens
- Each collateral type has an associated price feed

### Stablecoin Minting
- Users can mint stablecoins against their deposited collateral
- Minting is subject to maintaining a healthy collateralization ratio

### Health Factor
- A user's position health is measured by the "health factor"
- Positions with a health factor below the minimum are subject to liquidation

### Dynamic Liquidation Threshold
- The liquidation threshold adjusts based on market volatility
- Higher volatility leads to a higher threshold, providing more protection against rapid price movements

## Key Functions

- `depositCollateralAndMintDsc`: Deposit collateral and mint stablecoins in one transaction
- `redeemCollateralForDsc`: Burn stablecoins to redeem collateral
- `liquidate`: Allow liquidators to liquidate unhealthy positions

## Advanced Feature: Dynamic Liquidation Threshold

The dynamic liquidation threshold feature adjusts the required collateralization ratio based on market conditions:

1. Price history is maintained for each collateral type
2. Volatility is calculated based on recent price movements
3. The liquidation threshold increases during high volatility periods
4. This adaptive approach provides better protection against market fluctuations

## Installation

1. Clone the repository
2. Install dependencies: `npm install`
3. Compile contracts: `npx hardhat compile`

## Testing

Run the test suite:

```
npx hardhat test
```

## Deployment

1. Set up your `.env` file with required parameters
2. Run deployment script: `npx hardhat run scripts/deploy.js --network <your-network>`

## Security Considerations

- This contract has not been audited. Use at your own risk.
- Ensure proper access controls and input validation in production.
- Thoroughly test all scenarios, especially around liquidations and extreme market conditions.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License.
