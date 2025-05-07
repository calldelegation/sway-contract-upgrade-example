contract;

// CHANGE ME BEFORE REDEPLOYING! 
const VERSION: u8 = 7u8;

abi Counter {
    #[storage(read)]
    fn get_version() -> u8;

    #[storage(read, write)]
    fn increment(amount: u64) -> u64;

    #[storage(read)]
    fn get() -> u64;
}

storage {
    counter: u64 = 69,
}

impl Counter for Contract {
    #[storage(read, write)]
    fn increment(amount: u64) -> u64 {
        let incremented = storage.counter.read() + amount;
        storage.counter.write(incremented);
        incremented
    }

    #[storage(read)]
    fn get() -> u64 {
        storage.counter.read()
    }

    #[storage(read)]
    fn get_version() -> u8 {
        VERSION
    }
}