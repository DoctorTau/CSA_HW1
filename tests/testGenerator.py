from random import randint

n = 1000

for i in range(5,1001):
    with open(f'./tests/test{i}.in', 'w') as f:
        n = randint(3, 1000)
        f.write(f'{n}\n')
        for j in range(n):
            f.write(f'{randint(-10000, 10000)} ')