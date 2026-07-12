# daniel-pimenta-cc.github.io

Meu portfólio pessoal — [dspimenta.com](https://dspimenta.com) — construído com Flutter Web.

## Rodar localmente

```bash
flutter pub get
flutter run -d chrome
```

## Deploy

O GitHub Pages serve o branch `site` (raiz). Para publicar:

```bash
flutter build web --release
# copie o conteúdo de build/web para o branch site e faça push
```

## Créditos

Baseado no template [Aerium](https://github.com/david-legend/aerium) de David Cobbina,
inspirado no design de Pavel G.
