// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title LedgerAnchor
 * @dev Anchors Merkle roots from the RenderTrust ledger to provide immutable verification
 */
contract LedgerAnchor {
    // Events
    event RootAnchored(bytes32 indexed root, uint256 indexed batchId, uint256 entryCount);
    
    // State variables
    uint256 public lastBatch;
    mapping(uint256 => bytes32) public batchRoots;
    mapping(uint256 => uint256) public batchSizes;
    mapping(uint256 => uint256) public batchTimestamps;
    
    /**
     * @dev Anchors a new Merkle root to the blockchain
     * @param root The Merkle root of the ledger entries
     * @param entryCount The number of entries in this batch
     */
    function anchorRoot(bytes32 root, uint256 entryCount) external {
        require(root != bytes32(0), "Invalid root");
        require(entryCount > 0, "No entries");
        
        // Increment batch counter
        lastBatch++;
        
        // Store batch data
        batchRoots[lastBatch] = root;
        batchSizes[lastBatch] = entryCount;
        batchTimestamps[lastBatch] = block.timestamp;
        
        // Emit event
        emit RootAnchored(root, lastBatch, entryCount);
    }
    
    /**
     * @dev Verifies if a Merkle proof is valid for a given entry
     * @param batchId The batch ID to verify against
     * @param proof The Merkle proof
     * @param leaf The leaf node (entry hash)
     * @return True if the proof is valid
     */
    function verifyProof(uint256 batchId, bytes32[] calldata proof, bytes32 leaf) external view returns (bool) {
        require(batchId > 0 && batchId <= lastBatch, "Invalid batch ID");
        bytes32 root = batchRoots[batchId];
        
        bytes32 computedHash = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];
            
            if (computedHash < proofElement) {
                // Hash(current computed hash + current element of the proof)
                computedHash = keccak256(abi.encodePacked(computedHash, proofElement));
            } else {
                // Hash(current element of the proof + current computed hash)
                computedHash = keccak256(abi.encodePacked(proofElement, computedHash));
            }
        }
        
        // Check if the computed hash matches the root
        return computedHash == root;
    }
    
    /**
     * @dev Gets information about a specific batch
     * @param batchId The batch ID to query
     * @return root The Merkle root
     * @return entryCount The number of entries
     * @return timestamp The timestamp when the batch was anchored
     */
    function getBatchInfo(uint256 batchId) external view returns (bytes32 root, uint256 entryCount, uint256 timestamp) {
        require(batchId > 0 && batchId <= lastBatch, "Invalid batch ID");
        return (batchRoots[batchId], batchSizes[batchId], batchTimestamps[batchId]);
    }
}
