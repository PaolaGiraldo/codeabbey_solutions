function calculateDistance(numData: number[]): number {
  const angleC = 90;
  const angleRect = 180;
  process.stdout.write(
    `${Math.round(
      Math.tan(((numData[1] - angleC) * Math.PI) / angleRect) * numData[0]
    )} `
  );

  return 0;
}

function dataProcessing(inputData: string): number {
  const rowsData = inputData.split('\n').slice(1);
  rowsData.forEach((row: string) => {
    const numData = row.split(' ').map((numStr: string) => Number(numStr));
    calculateDistance(numData);

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
