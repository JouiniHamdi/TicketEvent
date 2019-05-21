pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721.sol';
import "./Ownable.sol";
/**
* @title OpenTicket
* @dev It is an implementation of ERC721 that provides ability to view information about tickets.
*/
contract OpenTicket is Ownable,ERC721{
	struct Ticket {
		uint event_id;
		uint seat;
	}

	Ticket[] internal tickets;





	/**
	* @dev Function to show ticket information.
	* @param _id uint - Ticket ID.
	* @return uint - Event ID.
	* @return uint - Ticket seat.
	*/
	function getTicket(uint _id) public view returns(uint, uint) {
		require(_id < tickets.length);
		Ticket memory _ticket = tickets[_id];
		return(_ticket.event_id, _ticket.seat);
	}
	modifier ownedTokens() {
	require(msg.sender == owner);
	_;
}
}
