/**
 * @title MoodNftTest
 * @dev Test suite for the MoodNft contract
 */
 contract MoodNftTest is Test {
    MoodNft moodNft;

    string public sadSvgUri = "data:image/svg+xml;base64,..."; // SVG data for sad mood
    string public happySvgUri = "data:image/svg+xml;base64,..."; // SVG data for happy mood

    address alice = makeAddr("alice");

    /**
     * @dev Sets up the test environment
     */
    function setUp() public {
        moodNft = new MoodNft(sadSvgUri, happySvgUri);
    }

    /**
     * @dev Tests viewing the token URI after minting
     */
    function testViewTokenURI() public {
        vm.prank(alice);
        moodNft.mintNFT();
        console.log(moodNft.tokenURI(0));
    }
}