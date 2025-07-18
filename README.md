# MEV-ARBITRAGE-BOT 📬 Contact & Support
For support or questions, reach out via Telegram:
📨 Contact @irfan_sopian
# 🚀 MEV Arbitrage Bot (Aave Flashloan + Uniswap/Sushiswap)

This repository contains a fully working MEV arbitrage trading bot that leverages **Aave flashloans** and performs profitable arbitrage between **Uniswap** and **Sushiswap**. The bot is written in Solidity and JavaScript, and designed to run on EVM-compatible networks like Ethereum, Polygon, or BNB Chain.

> ⚠️ This is for **educational and research purposes only**. Use at your own risk.

## 💡 Features

- ✅ Aave V3 Flashloan integration  
- ✅ Arbitrage between Uniswap and Sushiswap  
- ✅ Solidity smart contract + JavaScript scripts  
- ✅ Profit logic built-in (buys low, sells high)  
- ✅ Easily deployable and customizable

## 🛠️ Requirements

- Node.js (v14 or above)
- Hardhat
- Metamask + Testnet ETH (Goerli recommended)
- Aave Lending Pool address (from core-v3)
- Uniswap/Sushiswap Factory & Router addresses

## 📦 Installation

```bash
git clone https://github.com/FLASHUSDT2025/MEV-ARBITRAGE-BOT.git
cd MEV-ARBITRAGE-BOT
npm install


npx hardhat compile
npx hardhat run scripts/deploy.js --network yourNetwork
node scripts/arbitrage.js

It will automatically monitor price differences and trigger arbitrage trades when profitable.

🧠 How It Works
Borrow tokens using Aave flashloan

Swap token on Uniswap → Receive tokenB

Swap tokenB on Sushiswap → Receive tokenA back

Repay flashloan + keep the profit (if any)

📬 Contact & Support
For support or questions, reach out via Telegram:
📨 Contact @irfan_sopian











