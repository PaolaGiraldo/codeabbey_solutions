function dataProcessing(inputData: string): number {
  const rowsData = inputData.split('\n');

  rowsData.forEach((row: string) => {
    if (/^0[Bb][0-1]+$|^[0-1][0-1]*[Bb]$/.test(row)) {
      console.log('bin');
    } else if (/^0[0-7]+$/.test(row)) {
      console.log('oct');
    } else if (/^0[Xx][0-9A-Fa-f]+$|^[0-9][0-9A-F]*[Hh]$/.test(row)) {
      console.log('hex');
    } else if (/^[1-9][0-9]*$/.test(row)) {
      console.log('dec');
    } else {
      console.log(row);
    }

    return 0;
  });
  return 0;
}

function main(): number {
  process.stdin.setEncoding('utf8');
  process.stdin.on('readable', () => {
    const inputData = process.stdin.read();
    if (inputData !== null) {
      dataProcessing(inputData);
    }
    return 'Data Loaded';
  });
  return 0;
}

main();
