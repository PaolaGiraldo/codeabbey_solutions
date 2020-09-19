function play(matches: number, picks: number, rule: string) {
  const result = new Map();
  result.set('result', 0);
  if (rule === 'n') {
    if (Math.floor(matches / picks) === 1) {
      result.set('result', Math.abs(1 - (matches % picks)));
    } else {
      const iterable = Array.from(
        { length: (picks - 1) / 1 + 1 },
        (_var, i) => 1 + Number(i) * 1
      );
      iterable.forEach((i: number) => {
        if ((matches - Number(i)) % (+Number(picks) + 1) === 0) {
          result.set('result', Number(i));
        }
        return 1;
      });
    }
    process.stdout.write(`${result.get('result')} `);
  } else {
    if (Math.floor(matches / picks) === 2) {
      result.set('result', matches - picks - 2);
    } else {
      const iterable = Array.from(
        { length: (picks - 1) / 1 + 1 },
        (_var, i) => 1 + Number(i) * 1
      );
      iterable.forEach((i: number) => {
        if ((matches - Number(i)) % (+Number(picks) + 1) === 1) {
          result.set('result', Number(i));
        }
        return 1;
      });
    }
    process.stdout.write(`${result.get('result')} `);
  }
  return 1;
}

function dataProcessing(inputData: string): number {
  const numData = inputData.split('\n').slice(1);
  numData.forEach((row: string) => {
    const [matches, picks, rule] = [
      Number(row.split(' ')[0]),
      Number(row.split(' ')[1]),
      row.split(' ')[2],
    ];
    play(matches, picks, rule);
    return 1;
  });

  return 1;
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
