// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { DecentralizedStableCoin } from "./DecentralizedStableCoin.sol";
import { ReentrancyGuard } from "@openzeppelin/contracts/security/ReentrancyGuard.sol";
/**
 * @title DSCEngine
 * @author Yash Bharti
 * @notice This contract is the core of the Decentralized Stablecoin system. It handles all the logic
 * for minting and redeeming DSC, as well as depositing and withdrawing collateral.
 * @notice This contract is based on the MakerDAO DSS system
 * @dev The System is Designed to be as Minimal as Possible, and have the tokens maintain $1 == $1 Peg
 */
contract DSCEngine {
    error DSCEngine_CollateralMustBeGreaterThanZero();
    error DSCEngine__ArrayLengthMismatch();
    error DSCEngine__TokenNotAllowed(address token);

    DecentralizedStableCoin private immutable i_dsc;
    mapping(address token => address priceFeed) private s_priceFeeds;

    modifier moreThanZero(uint256 amount) {
        if (amount == 0) {
            revert DSCEngine_CollateralMustBeGreaterThanZero();
        }
        _;
    }

    modifier isAllowedToken(address token) {
        if (s_priceFeeds[token] == address(0)) {
            revert DSCEngine__TokenNotAllowed(token);
        }
        _;
    }

    /**
     * @notice Initializes the DSCEngine contract
     * @param tokenAddress An array of token addresses that can be used as collateral
     * @param priceFeedAddress An array of price feed addresses corresponding to the token addresses
     * @param dscAddress The address of the DecentralizedStableCoin contract
     */
    constructor(address[] memory tokenAddress, address[] memory priceFeedAddress, address dscAddress) {
        if (tokenAddress.length != priceFeedAddress.length) {
            revert DSCEngine__ArrayLengthMismatch();
        }
        for (uint256 i = 0; i < tokenAddress.length; i++) {
            s_priceFeeds[tokenAddress[i]] = priceFeedAddress[i];
        }
        i_dsc = DecentralizedStableCoin(dscAddress);
    }

    /**
     * @notice Deposits collateral and mints DSC in a single transaction
     * @dev This function is not implemented in the provided code
     */
    function depositCollateralAndMintDsc() external {}

    /**
     * @notice Deposits collateral into the system
     * @param tokenCollateral The address of the token to be used as collateral
     * @param amount The amount of collateral to deposit
     */
    function depositeCollateral(address tokenCollateralAddress , uint256 amount) external moreThanZero(amount) isAllowedToken(tokenCollateralAddress) nonReentrant  {}

    /**
     * @notice Redeems collateral for DSC
     * @dev This function is not implemented in the provided code
     */
    function redeemCollateralForDsc() external {}

    /**
     * @notice Mints new DSC tokens
     * @dev This function is not implemented in the provided code
     */
    function mindDSC() external {}

    /**
     * @notice Burns DSC tokens
     * @dev This function is not implemented in the provided code
     */
    function burnDsc() external {}

    /**
     * @notice Liquidates a position
     * @dev This function is not implemented in the provided code
     */
    function liquidate() external {}

    /**
     * @notice Redeems collateral
     * @dev This function is not implemented in the provided code
     */
    function redeemCollateral() external {}

    function getHealthFactor() external view {}
}