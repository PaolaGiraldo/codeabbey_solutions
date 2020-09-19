function calculateModExp(numData: number[]): number {
  const [base, exponent, module] = [numData[0], numData[1], numData[2]];

  if (exponent === 0) {
    const result = 1;
    console.log(result);
  } else if (exponent % 2 === 0) {
    const res = Math.pow(base, exponent / 2) % module;
    const result = (res * res) % module;
    console.log(result);
  } else {
    const result =
      (((base % module) * Math.pow(base, exponent - 1)) % module) % module;
    console.log(result);
  }
  return 0;
}

function dataProcessing(inputData: string): number {
  const rowsData = inputData.split('\n').slice(1);
  rowsData.forEach((row: string) => {
    const numData = row.split(' ').map((numStr: string) => Number(numStr));
    calculateModExp(numData);
    return 'Data Processed';
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
