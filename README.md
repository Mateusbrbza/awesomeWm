# AwesomeWM Configuration

Documentação completa da configuração do Awesome Window Manager.

## 📋 Índice

- [Visão Geral](#visão-geral)
- [Temas](#temas)
- [Plugins e Bibliotecas](#plugins-e-bibliotecas)
- [rc.lua - Arquivo Principal](#rclua---arquivo-principal)
- [Configurações](#configurações)

---

## Visão Geral

Esta configuração do AwesomeWM utiliza o tema PowerArrow como base, com suporte a múltiplos temas personalizados, widgets avançados e integração com diversas ferramentas do sistema.

### Características Principais

- ✨ Múltiplos temas personalizados baseados no PowerArrow
- 🎨 Suporte completo ao Catppuccin Mocha
- 📦 Integração com bibliotecas `lain` e `freedesktop`
- 🎯 Widgets para sistema, rede, clima e mídia
- ⌨️ Atalhos de teclado personalizados
- 🎭 Layouts de janela configuráveis

---

## Temas

### Temas Disponíveis

A configuração suporta os seguintes temas (definidos em `settings.lua`):

1. **PowerArrow_Neon**
2. **PowerArrow_Genesis**
3. **PowerArrow_Matcha** - Tema verde com inspiração Matcha
4. **PowerArrow_RGB**
5. **PowerArrow_CalmRed** - Tema vermelho suave
6. **PowerArrow_Catppuccin** - Tema baseado no Catppuccin Mocha (atual)

### Como Mudar o Tema

Edite o arquivo `settings.lua` e altere o índice do tema:

```lua
settings.chosen_theme = settings.themes[6]  -- Altere o número aqui
```

**Exemplo:**
- `settings.themes[1]` = PowerArrow_Neon
- `settings.themes[3]` = PowerArrow_Matcha
- `settings.themes[6]` = PowerArrow_Catppuccin

Após alterar, recarregue o AwesomeWM com `Mod4 + Ctrl + R`.

### Estrutura de um Tema

Cada tema está localizado em `themes/NomeDoTema/` e contém:

- **NomeDoTema.lua** - Arquivo principal do tema com:
  - Paleta de cores
  - Configuração de fontes
  - Widgets (CPU, memória, rede, clima, etc.)
  - Ícones e layouts
  - Função `at_screen_connect()` para criar a barra superior

- **icons/** - Diretório com ícones do tema:
  - Ícones de sistema (bateria, CPU, memória, etc.)
  - Ícones de layout (tile, floating, etc.)
  - Ícones de titlebar (close, maximize, etc.)

- **wallpaper.jpg/png** - Papel de parede do tema

### Personalizando Cores (Exemplo: Catppuccin Mocha)

No arquivo do tema (`PowerArrow_Catppuccin.lua`), você pode personalizar as cores:

```lua
-- Cores principais
theme.fg_normal        = "#cdd6f4"  -- Cor do texto normal
theme.primarycolor     = "#1e1e2e"  -- Cor primária (fundo dos widgets)
theme.secondarycolor   = "#313244"  -- Cor secundária (alternância)
theme.bg_normal        = "#1e1e2e"  -- Cor de fundo
theme.bg_focus         = "#89b4fa"  -- Cor de foco

-- Bordas
theme.border_normal    = "#313244"  -- Borda normal
theme.border_focus     = "#89b4fa"  -- Borda quando em foco
theme.border_marked    = "#cba6f7"  -- Borda marcada
```

---

## Plugins e Bibliotecas

### 1. Lain (`lain/`)

Biblioteca essencial que fornece widgets, layouts alternativos e utilitários.

#### Widgets Disponíveis

- **CPU** (`lain.widget.cpu`) - Monitoramento de uso de CPU
- **Memória** (`lain.widget.mem`) - Uso de memória RAM
- **Temperatura** (`lain.widget.temp`) - Temperatura do sistema
- **Rede** (`lain.widget.net`) - Tráfego de rede (upload/download)
- **Bateria** (`lain.widget.bat`) - Status da bateria
- **Volume** (`lain.widget.alsa` / `lain.widget.pulse`) - Controle de áudio
- **Clima** (`lain.widget.weather`) - Informações meteorológicas
- **MPD** (`lain.widget.mpd`) - Controle de música (MPD)
- **Calendário** (`lain.widget.cal`) - Widget de calendário

#### Layouts Alternativos

- `lain.layout.cascade`
- `lain.layout.centerwork`
- `lain.layout.termfair`

#### Utilidades

- `lain.util.markup` - Formatação de texto
- `lain.util.separators` - Separadores visuais (setas powerline)

### 2. Freedesktop (`freedesktop/`)

Integração com padrões freedesktop para:
- Menu de aplicações
- Ícones de aplicações
- Integração com ambiente desktop

### 3. Bibliotecas Nativas do Awesome

- **gears** - Utilitários (cores, objetos, etc.)
- **awful** - Gerenciamento de janelas
- **wibox** - Widgets e barras
- **beautiful** - Sistema de temas
- **naughty** - Notificações
- **hotkeys_popup** - Popup de ajuda de atalhos

---

## rc.lua - Arquivo Principal

O arquivo `rc.lua` é o coração da configuração. Ele contém:

### 1. Configurações Iniciais

```lua
local modkey  = "Mod4"  -- Tecla Super/Windows
local altkey  = "Mod1"  -- Tecla Alt
local terminal = "alacritty"
local editor   = "nvim"
```

### 2. Tags (Workspaces)

Por padrão, há 6 tags (workspaces) numeradas de 1 a 6:

```lua
awful.util.tagnames = { "1", "2", "3", "4", "5", "6" }
```

### 3. Layouts de Janela

Três layouts estão configurados:

```lua
awful.layout.layouts = {
    awful.layout.suit.tile,        -- Layout em azulejo padrão
    awful.layout.suit.tile.left,   -- Layout em azulejo à esquerda
    awful.layout.suit.floating,     -- Layout flutuante
}
```

### 4. Regras de Janelas

Regras aplicadas automaticamente a novas janelas:
- Largura de borda
- Cores de borda
- Foco automático
- Titlebars (configurável em `settings.lua`)

### 5. Programas de Inicialização

Programas iniciados automaticamente (configuráveis em `settings.lua`):
- `nitrogen` - Gerenciador de wallpaper
- `picom` - Compositor (transparências e sombras)
- `nm-applet` - Applet de rede
- `lxpolkit` - Política de permissões
- `flameshot` - Ferramenta de captura de tela
- `kmix` - Mixer de áudio

---

## Configurações

### Arquivo `settings.lua`

Este arquivo centraliza as principais configurações:

#### Temas

```lua
settings.themes = {
    "PowerArrow_Neon",
    "PowerArrow_Genesis",
    "PowerArrow_Matcha",
    "PowerArrow_RGB",
    "PowerArrow_CalmRed",
    "PowerArrow_Catppuccin"
}

settings.chosen_theme = settings.themes[6]  -- Tema atual
```

#### Aparência

```lua
settings.enableTitlebar = false  -- Titlebars nas janelas
settings.gapsize = 5             -- Tamanho dos gaps entre janelas
settings.focusOnHover = false    -- Focar janela ao passar mouse
```

#### Programas de Inicialização

```lua
settings.useNitrogen = true    -- Gerenciador de wallpaper
settings.usePicom = true       -- Compositor
settings.useNMApplet = true    -- Applet de rede
settings.useLxPolkit = true    -- Política de permissões
settings.useFlameShot = true   -- Captura de tela
```

#### Clima

```lua
settings.weatherID = 3463237  -- ID da cidade (obter em openweathermap.org)
```

### Personalização de Variáveis no rc.lua

Você pode personalizar diretamente no `rc.lua`:

```lua
-- Terminal
local terminal = "alacritty"  -- Altere para seu terminal preferido

-- Editor
local editor = os.getenv("EDITOR") or "nvim"  -- Seu editor preferido

-- Teclas modificadoras
local modkey = "Mod4"  -- Tecla Super/Windows
local altkey = "Mod1"  -- Tecla Alt
```

---

## Dicas e Truques

### Recarregar Configuração

Após fazer alterações, recarregue o AwesomeWM:
- **Teclado:** `Mod4 + Ctrl + R`
- **Terminal:** `awesome-client 'awesome.restart()'`

### Verificar Erros

Se houver erros, eles aparecerão como notificações. Você também pode verificar o log:
```bash
tail -f ~/.cache/awesome/awesome.log
```

### Adicionar Novos Widgets

1. Configure o widget no arquivo do tema (ex: `PowerArrow_Catppuccin.lua`)
2. Adicione o widget à barra superior na função `at_screen_connect()`
3. Recarregue o AwesomeWM

### Personalizar Menu

O menu principal é construído usando `freedesktop` e pode ser personalizado em `rc.lua` na seção `myawesomemenu`.

---

## Recursos Adicionais

- [Documentação Oficial do AwesomeWM](https://awesomewm.org/doc/api/)
- [Lain - Widgets e Layouts](https://github.com/lcpz/lain)
- [AwesomeWM Wiki](https://awesomewm.org/wiki/Main_Page)
- [Catppuccin Color Palette](https://catppuccin.com/palette)

---

**Última atualização:** Dec 2025
