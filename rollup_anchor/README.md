# RenderTrust Rollup Anchor

![License: Mixed](https://img.shields.io/badge/License-Mixed-yellow.svg)

This module provides blockchain anchoring for the RenderTrust ledger, ensuring immutable verification of transaction records.

**License Note**: The core components of this module are licensed under Apache 2.0, while the paymaster service is under the Enterprise License. See [../../LICENSE-APACHE-2.0](../../LICENSE-APACHE-2.0) and [../../LICENSE-ENTERPRISE](../../LICENSE-ENTERPRISE) for details.

## Overview

The rollup anchor consists of:

1. **Smart Contract** (`LedgerAnchor.sol`): Solidity contract that stores Merkle roots on-chain
2. **Python Bundler** (`bundler.py`): Service that bundles ledger entries into Merkle trees and anchors them to the blockchain
3. **Verification Tools**: Utilities to verify that ledger entries are included in anchored Merkle trees

## Quick Start

Follow these steps to set up the rollup anchor:

```bash
# 1. Smart-Contract Setup (Hardhat)
mkdir eth && cd eth
npm init -y
npm i --save-dev hardhat @nomicfoundation/hardhat-toolbox
npx hardhat # choose "create basic sample project"

# Replace Lock.sol with LedgerAnchor.sol
cp ../contracts/LedgerAnchor.sol contracts/

# 2. Compile & Test
npx hardhat compile
# Create test file (see documentation)
npx hardhat test

# 3. Spin up Local Node & Deploy
npx hardhat node --hostname 0.0.0.0 &
npx hardhat run --network localhost scripts/deploy.js

# 4. Set up Environment Variables
export CONTRACT=<printed address>
export RPC_URL=http://127.0.0.1:8545
export PRIVATE_KEY=<private key>
export PG_DSN=postgresql://localhost/rendertrust

# 5. Run the Bundler
python bundler.py
```

## Architecture

The system works as follows:

1. Ledger entries are written to the PostgreSQL database with a SHA-256 hash
2. The bundler periodically collects unanchored entries and builds a Merkle tree
3. The Merkle root is submitted to the LedgerAnchor smart contract on-chain
4. The transaction hash is recorded in the database, marking entries as anchored
5. Verification can be performed by generating a Merkle proof and checking it against the on-chain root

## Production Deployment

For production deployment:

1. Deploy the LedgerAnchor contract to Polygon zkEVM or OP-Stack testnet
2. Containerize the bundler.py script and set up health monitoring
3. Configure secure key management for the blockchain private key
4. Add API endpoints for proof verification

## Security Considerations

- The bundler requires access to a private key with funds for gas
- Ensure proper monitoring of the anchoring process
- Consider implementing a multi-signature scheme for contract upgrades
- Run a security audit on the Solidity code before mainnet deployment

## License

Proprietary - All rights reserved
