// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IERC165} from "@openzeppelin/contracts/utils/introspection/ERC165.sol";

/**
 * This is FeeConfig contract that stores all the fees and treasury data.
 */
interface IFeeConfig is IERC165 {
    /**
     * The event that is emitted when the fee for sender is set.
     * @param sender The sender address.
     * @param fee The fee.
     */
    event FeeSet(address indexed sender, uint256 fee);

    /**
     * The event that is emitted when the fee for sender for the operation is set.
     * @param sender The sender address.
     * @param operation The operation.
     * @param fee The fee.
     */
    event FeeForOperationSet(address indexed sender, bytes32 operation, uint256 fee);

    /**
     * The event that is emitted when the fee for sender for the operation is discarded.
     * @param sender The sender address.
     * @param operation The operation.
     */
    event FeeForOperationDiscarded(address indexed sender, bytes32 operation);

    /**
     * The event that is emitted when the treasury address is set.
     * @param treasury The treasury address.
     */
    event TreasurySet(address treasury);

    /**
     * The event that is emitted when the base fee is set.
     * @param baseFee The base fee.
     */
    event BaseFeeSet(uint256 baseFee);

    /**
     * The event that is emitted when the base fee for the operation is set.
     * @param operation The operation.
     * @param baseFeeForOperation The base fee for the operation.
     */
    event BaseFeeForOperationSet(bytes32 operation, uint256 baseFeeForOperation);

    /**
     * The function that initializes the contract.
     * @param treasury_ The treasury address.
     * @param baseFee_ The base fee.
     */
    function FeeConfig_init(address treasury_, uint256 baseFee_) external;

    /**
     * The function that returns the treasury address.
     */
    function treasury() external view returns (address);

    /**
     * The function that returns the base fee.
     */
    function baseFee() external view returns (uint256);

    /**
     * The function that returns the fee for the sender.
     * @dev If the fee is 0, the base fee is used.
     */
    function fees(address sender_) external view returns (uint256);

    /**
     * The function that returns the fee and treasury address for the sender.
     */
    function getFeeAndTreasury(address sender_) external view returns (uint256, address);

    /**
     * The function that returns the fee and treasury address for the sender for the operation.
     */
    function getFeeAndTreasuryForOperation(
        address sender_,
        bytes32 operation_
    ) external view returns (uint256, address);

    /**
     * The function that sets the fee for the sender.
     */
    function setFee(address sender_, uint256 fee_) external;

    /**
     * The function that sets the fee for the sender for the operation.
     */
    function setFeeForOperation(address sender_, bytes32 operation_, uint256 fee_) external;

    /**
     * The function that discards the fee for the sender for the operation.
     */
    function discardCustomFee(address sender_, bytes32 operation_) external;

    /**
     * The function that sets the fee for the sender for the operation.
     */
    function setBaseFeeForOperation(bytes32 operation_, uint256 baseFeeForOperation_) external;

    /**
     * The function that sets the treasury address.
     */
    function setTreasury(address treasury_) external;

    /**
     * The function that sets the base fee.
     */
    function setBaseFee(uint256 baseFee_) external;
}
