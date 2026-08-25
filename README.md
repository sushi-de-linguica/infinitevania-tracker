# infinitevania-tracker

Pack de [PopTracker](https://github.com/black-sliver/PopTracker) para
Infinitevania com **auto-tracking**: jogando com o
infinitevania-randomizer (em breve).

<img width="1910" height="1026" alt="image" src="https://github.com/user-attachments/assets/2f48badc-9bb1-4137-9563-df5de5605619" />

## Como usar

1. Instale o PopTracker (>= 0.25) e carregue este pack (aponte o diretório de
   packs para a pasta que contém este repo, ou zipe e coloque em `packs/`).
2. Rode o jogo com o randomizer ativo (o launcher já faz isso). O plugin abre
   um servidor UAT em `ws://localhost:65399`.
3. No PopTracker, clique no símbolo de auto-tracking ("AT") e habilite **UAT**.
   Conectou: tudo passa a marcar sozinho — checks no mapa, habilidades, chaves,
   artefatos de PM, fragmentos, espíritos e diários.

## Espíritos: custo de PM

A grade "Espíritos por PM" agrupa os 30 espíritos pelo `SpiritInfo.cost` do
jogo (quantos slots de PM o espírito ocupa ao equipar). O número sobre cada
ícone é o id do espírito (`Spirit:N` no randomizer, `item/SpiritN` no UAT).

| PM | Espíritos (id) |
|---|---|
| 1 | Vitalidade (2), Fúria (3), Velocidade (7), Ouriço Azul (9), Bibliotecário (11), Colecionador (12), Coração (13), Perdidos (14), Conhecimento (15), Redemoinho (18), Destruidor (21), Kamui (24) |
| 2 | Sorte (6), Dor (17), Amaterasu (19), Sábio das Montanhas (22), Retaliação (23), Resiliente (26), Etéreo (27), Ígneo (28) |
| 3 | Almas (1), Agilidade (4), Força (5), Kaminari (8), Protetor (10), Chama Eterna (16), Espectral (20), Cura (25), Orbital (29), Crisaegr (30) |

Fonte: os ScriptableObjects `N_Espírito …` em `Infinitevania_Data/resources.assets`
(lidos com UnityPy; o AssetRipper exporta esses assets vazios). Os últimos
ints de cada objeto são `modifierFloat, modifierInt, modifierPercent, cost`
mais dois campos novos da build 24761820 — `cost` é o antepenúltimo.
