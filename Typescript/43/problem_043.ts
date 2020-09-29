process.stdin.setEncoding('utf8');
process.stdin.on('readable', () => {
  const inputData = process.stdin.read();
  if (inputData !== null) {
    const rowsData = inputData.split('\n').slice(1);
    rowsData.forEach((row: string) => {
      const dice = 6;
      process.stdout.write(`${Math.floor(Number(row) * dice) + 1} `);
      return 'Output';
    });
  }
  return 'Data loaded';
});
