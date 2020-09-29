
process.stdin.setEncoding('utf8');
process.stdin.on('readable', () => {
  const inputData = process.stdin.read();
  if (inputData !== null) {
    const rowsData = inputData.split('\n').slice(1);
    rowsData.forEach((row: string) => {
      const nums = row.split(' ').map((numStr: string) => Number(numStr));
      process.stdout.write(`${Math.round(nums[0] / nums[1])}`);
      return 'Output';
    });
  }
  return 'Data loaded';
});
