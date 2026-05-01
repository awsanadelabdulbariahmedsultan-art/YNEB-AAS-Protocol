// SPDX-License-Identifier: MIT
/**
 * @title AAS Global Standard for Real World Assets (RWA) - Energy & Minerals
 * @author Eng. Awsan Adel Abdulbari Ahmed Sultan
 * @notice World's first protocol for mapping oil wells and mineral mines to NFT ART units.
 * @dev Intellectual Property (IP) globally reserved to the creator.
 * 
 * IP HOLDER DATA (OFFICIAL RECORD):
 * - FULL NAME: ENG. AWSAN ADEL ABDULBARI AHMED SULTAN
 * - ID NUMBER: 01010305468 | NATIONALITY: YEMEN
 * - CONTACT: +967 777852433 | AWSAN.SULTAN@GMAIL.COM
 * - LINKEDIN: https://www.linkedin.com/in/awsan-adel-abdulbari-ahmed-sultan-8aa5a1a9
 * - ROYALTY WALLET: 0x8B97416F3673EdAE23E944c11D90E0e6EF19E19C
 * - GLOBAL ROYALTY FEE: 0.001% (Fixed for all AAS-Standard deployments)
 */

pragma solidity ^0.8.0;

contract AAS_Unified_Global_Protocol {
    
    // --- Immutable IP Metadata ---
    string public constant CREATOR = "ENG. AWSAN ADEL ABDULBARI AHMED SULTAN";
    string public constant CREATOR_ID = "01010305468";
    string public constant CREATOR_EMAIL = "AWSAN.SULTAN@GMAIL.COM";
    address public constant CREATOR_WALLET = 0x8B97416F3673EdAE23E944c11D90E0e6EF19E19C;
    
    // Global IP Royalty (0.001%) represented in Basis Points (1 per 100,000)
    uint256 public constant GLOBAL_IP_ROYALTY_BPS = 1; 

    struct AssetNFT {
        string assetType;         // Oil, Gas, Gold, Minerals
        string locationID;        // Well/Mine Identification Number
        uint256 estimatedYield;   // Future production estimation
        uint256 totalARTUnits;    // Number of NFT ART units for this asset
        uint256 pricePerART;      // Valuation per ART unit
        bool isActive;
    }

    mapping(uint256 => AssetNFT) public globalRegistry;
    uint256 public assetCounter;

    // Documentation Events for blockchain transparency
    event AssetRegistered(uint256 indexed assetId, string locationID, uint256 totalUnits);
    event IP_Royalty_Verified(address indexed creator, uint256 royalty);

    constructor() {
        emit IP_Royalty_Verified(CREATOR_WALLET, GLOBAL_IP_ROYALTY_BPS);
    }

    /**
     * @dev Registers a new Oil/Mineral asset as an NFT under the AAS Global Standard.
     */
    function registerAASAsset(
        string memory _type,
        string memory _locID,
        uint256 _yield,
        uint256 _units,
        uint256 _price
    ) public {
        globalRegistry[assetCounter] = AssetNFT({
            assetType: _type,
            locationID: _locID,
            estimatedYield: _yield,
            totalARTUnits: _units,
            pricePerART: _price,
            isActive: true
        });

        emit AssetRegistered(assetCounter, _locID, _units);
        assetCounter++;
    }

    /**
     * @dev Legal Origin Proof: This function serves as a permanent on-chain intellectual property claim.
     */
    function getOriginProof() public pure returns (string memory) {
        return "This AAS-Standard is the exclusive IP of Eng. Awsan Sultan (Yemen). All global implementations owe a 0.001% royalty fee to the creator's wallet.";
    }

    function getCreatorContact() public pure returns (string memory) {
        return "Contact: +967 777852433 | LinkedIn: awsan-adel-abdulbari-ahmed-sultan-8aa5a1a9";
    }
}
