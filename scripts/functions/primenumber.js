function primeNumber(n) {
  const t0 = Date.now();
  const primes = [];

  for (let i = 2; i <= n; i++) {
    let isPrime = true;
    for (let j = 2; j < i; j++) {
      if (i % j === 0) {
        isPrime = false;
        break;
      }
    }
    if (isPrime) {
      primes.push(i);
    }
  }

  const output = primes.length;
  const tm = (Date.now() - t0) / 1000;

  return { primenumber: output, time: tm };
}

function main(params) {
  const prime = params.primenumber || 15000;
  const result = primeNumber(prime);
  return result;
}
