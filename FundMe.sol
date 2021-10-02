// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;
import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {

        addressToAmountFunded[msg.sender] += msg.value;

    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
        return priceFeed.version();
    }

    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);

        (
         uint80 roundId,
         int256 answer,
         uint256 startedAt,
         uint256 updatedAt,
         uint80 answeredInRound)
         = priceFeed.latestRoundData();

         return uint256(answer);
    }
}
