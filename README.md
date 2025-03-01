# Blockchain-Based Supply Chain Tracker

## Overview
A decentralized supply chain tracking system using Ethereum smart contracts. It allows secure and transparent tracking of goods from origin to destination.

## Features
- **Product Creation**: Add products with details like name, origin, and owner.
- **Ownership Transfer**: Transfer product ownership securely on the blockchain.
- **Status Updates**: Track product status changes with a full history log.
- **Third-Party Verification**: External verifiers can validate products.
- **Product Recall**: Owners can recall products if needed.

## Installation & Deployment
1. Install dependencies:
   ```bash
   npm install -g truffle
   ```
2. Compile the contract:
   ```bash
   truffle compile
   ```
3. Deploy the contract:
   ```bash
   truffle migrate --network development
   ```
