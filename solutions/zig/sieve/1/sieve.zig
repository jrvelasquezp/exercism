const std = @import("std");

pub fn primes(buffer: []u32, limit: u32) []u32 {
    var buffer_size: u32 = 200;
    var number_size: u32 = 0;
    var sieve_size: u32 = 0;
    var numbers: [1000]u32 = undefined;
    var sieve: [1000]u32 = undefined;
    var factor: u32 = 0;
    var prime: u32 = 0;
    var i: u32 = 0;
    var j: u32 = 0;
    var k: u32 = 0;
    for (0..buffer_size) |n| {
        buffer[n]=0;    
    }
    if (limit == 2) {
        sieve_size=1;
        sieve[0]=2;
    }
    else {
        //1. fill buffer
        for (0..limit-1) |n| {
            numbers[n]=2+number_size;
            number_size+=1;
        }
        //2. iterate over primes. Start from 2 (numbers[0]) and factor (numbers[i])
        while (k < number_size) {
            prime=numbers[k];
            sieve_size=0;
            i=0;
            while (i < number_size) {
                factor=numbers[j];
                if (numbers[i] < prime*factor) {
                    sieve[sieve_size]=numbers[i];
                    sieve_size+=1;
                }
                else if (numbers[i] >= prime*factor) {
                    j+=1;
                }
                i+=1;
            }
            //copy buffer in numbers
            for (0..sieve_size) |n| {
                numbers[n]=sieve[n];
            }
            number_size=sieve_size;
            k+=1;
            j=k;
        }
    }
    return sieve[0..sieve_size];
}