import Cycles "mo:base/ExperimentalCycles";
import Principal "mo:base/Principal";
import NFTActorClass "../NFT/nft";


actor OpenD {


    public  shared(msg) func mint(imgData: [Nat8], name: Text): async Principal {
        let owner : Principal = msg.caller;

        Cycles.add(100_500_000_000);
        let newNft = await NFTActorClass.NFT(name, owner, imgData);

        let newCFTPrincipal = await newNft.getCanisterId();

        return newCFTPrincipal

    };

};
