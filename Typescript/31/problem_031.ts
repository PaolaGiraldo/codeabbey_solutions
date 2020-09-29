process.stdin.setEncoding('utf8');
process.stdin.on('readable', () => {
  const inputData = process.stdin.read();
  let final: string;
  if (inputData !== null) {
    const rowsData = inputData.split('\n').slice(1);
    rowsData.forEach((row: string) => {
      const values = row.split(' ');
      const pos = +values[0];
      const sub = values[1].slice(pos);
      const str1 = values[1].split(sub);
      final = sub + str1[0];
      console.log(final);
      return 'Output';
    });
  }
  return 'Data loaded';
});
