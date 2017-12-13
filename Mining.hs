module Mining where

import Data.Number.CReal

diff :: CReal
diff = 1590896927258

ratio :: CReal
ratio = diff * 4295032833

max :: CReal
max = 115792089237316195423570985008687907853269984665640564039457584007913129639935

hr :: CReal
hr =  6

day :: CReal
day = hr * 24

reward :: CReal
reward = 12.5

antminer :: CReal
antminer = 14000000000000

trialSuccProb :: CReal
trialSuccProb = 1 / ratio

minerTrialSuccProb :: CReal -> CReal
minerTrialSuccProb hashrate = 1 - ((1 - trialSuccProb)**hashrate)

minerBlockFailProb :: CReal -> CReal
minerBlockFailProb miners = (1 - (minerTrialSuccProb (miners * antminer)))**(600)

minerBlockSuccProb :: CReal -> CReal -> CReal
minerBlockSuccProb blocks miners = 1 - (minerBlockFailProb miners)**blocks

btcMined :: CReal -> CReal -> CReal
btcMined blocks miners = reward * (minerBlockSuccProb blocks miners)
