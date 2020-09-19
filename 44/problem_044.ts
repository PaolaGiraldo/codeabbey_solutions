
process.stdin.setEncoding('utf8');
process.stdin.on('readable', () => {
  const inputData = process.stdin.read();
  if (inputData !== null) {
    const diceSides = 6;
    const rowsData = inputData.split('\n').slice(1);
    rowsData.forEach((row: string) => {
      const nums = row.split(' ');
      const diceOne = Number(nums[0]) % diceSides + 1;
      const diceTwo = Number(nums[1]) % diceSides + 1;
      process.stdout.write(`${diceOne + diceTwo} `);
      return 'Output';
    });
  }
  return 'Data loaded';
});
