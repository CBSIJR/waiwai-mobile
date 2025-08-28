# Guia Completo: Configuração Flutter no Windows

## 📋 Pré-requisitos
- Windows 10 ou superior
- Conexão com internet
- Privilégios de administrador
- Pelo menos 5GB de espaço livre

---

## 🔧 Passo 1: Instalação do Java JDK

### 1.1 Download do Java
1. Acesse: https://www.oracle.com/java/technologies/java-se-glance.html
2. Escolha uma das versões:
   - **Java 17 LTS** (Recomendado para estabilidade)
   - **Java 21 LTS** (Mais recente)

### 1.2 Instalação
1. Execute o instalador baixado
2. Siga as instruções padrão
3. **Anote o caminho de instalação** (geralmente `C:\Program Files\Java\jdk-17` ou `C:\Program Files\Java\jdk-21`)

### 1.3 Verificação
```cmd
java -version
```
Se não funcionar, continue para configurar as variáveis de ambiente.

---

## 🦋 Passo 2: Instalação do Flutter

### 2.1 Download do Flutter
1. Acesse: https://docs.flutter.dev/get-started/install/windows/mobile
2. Baixe o Flutter SDK para Windows
3. **Importante**: Baixe a versão estável (Stable)

### 2.2 Extração
1. Crie uma pasta `C:\flutter` (ou escolha outro local)
2. Extraia o arquivo ZIP do Flutter nesta pasta
3. O caminho final deve ser: `C:\flutter\bin\flutter.exe`

---

## 📱 Passo 3: Android Command Line Tools

### 3.1 Download das Ferramentas
1. Acesse: https://developer.android.com/studio?hl=pt-br#command-line-tools-only
2. Clique em **"Command line tools only"**
3. Baixe a versão para Windows

### 3.2 Criação da Estrutura de Pastas
```cmd
# Crie a estrutura de pastas necessária
mkdir C:\android-sdk
mkdir C:\android-sdk\cmdline-tools
mkdir C:\android-sdk\cmdline-tools\latest
```

### 3.3 Extração das Ferramentas
1. Extraia o arquivo ZIP baixado
2. **IMPORTANTE**: Mova todo o conteúdo da pasta `cmdline-tools` para:
   ```
   C:\android-sdk\cmdline-tools\latest\
   ```
3. A estrutura final deve ser:
   ```
   C:\android-sdk\
   ├── cmdline-tools\
   │   └── latest\
   │       ├── bin\
   │       ├── lib\
   │       └── ...
   ```

---

## 🌍 Passo 4: Configuração das Variáveis de Ambiente

### 4.1 Abrir Configurações do Sistema
1. Pressione `Win + R`
2. Digite `sysdm.cpl` e pressione Enter
3. Clique na aba **"Avançado"**
4. Clique em **"Variáveis de Ambiente"**

### 4.2 Configurar JAVA_HOME
1. Em **"Variáveis do sistema"**, clique em **"Novo"**
2. Nome: `JAVA_HOME`
3. Valor: Caminho do Java (ex: `C:\Program Files\Java\jdk-17`)

### 4.3 Configurar ANDROID_HOME
1. Clique em **"Novo"** novamente
2. Nome: `ANDROID_HOME`
3. Valor: `C:\android-sdk`

### 4.4 Configurar ANDROID_SDK_ROOT
1. Clique em **"Novo"** novamente
2. Nome: `ANDROID_SDK_ROOT`
3. Valor: `C:\android-sdk`

### 4.5 Atualizar PATH
1. Encontre a variável **"Path"** em **"Variáveis do sistema"**
2. Clique em **"Editar"**
3. Adicione os seguintes caminhos (clique em **"Novo"** para cada um):
   ```
   C:\flutter\bin
   C:\android-sdk\cmdline-tools\latest\bin
   C:\android-sdk\platform-tools
   %JAVA_HOME%\bin
   ```

### 4.6 Aplicar Alterações
1. Clique **"OK"** em todas as janelas
2. **Reinicie o Prompt de Comando** ou **reinicie o computador**

---

## ⚙️ Passo 5: Instalação dos Componentes Android

### 5.1 Abrir Novo Prompt de Comando
```cmd
# Abra um novo cmd como Administrador
# Pressione Win + X e escolha "Windows PowerShell (Admin)" ou "Prompt de Comando (Admin)"
```

### 5.2 Verificar sdkmanager
```cmd
sdkmanager --version
```

### 5.3 Instalar Componentes Necessários
```cmd
sdkmanager "platform-tools" "platforms;android-36" "build-tools;34.0.0"
```

**Observações:**
- Se aparecer uma pergunta sobre aceitar licenças, digite `y` e pressione Enter
- O download pode demorar alguns minutos
- Se der erro de "repositórios", execute:
  ```cmd
  sdkmanager --update
  ```

### 5.4 Verificar Instalação
```cmd
sdkmanager --list_installed
```

---

## 🔗 Passo 6: Configuração Final do Flutter

### 6.1 Configurar Android SDK no Flutter
```cmd
flutter config --android-sdk C:\android-sdk
```

### 6.2 Aceitar Licenças do Android
```cmd
flutter doctor --android-licenses
```
- Pressione `y` para aceitar todas as licenças
- Pode aparecer várias perguntas, aceite todas

---

## ✅ Passo 7: Verificação Final

### 7.1 Executar Flutter Doctor
```cmd
flutter doctor
```

### 7.2 Resultado Esperado
Você deve ver algo como:
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x, on Microsoft Windows)
[✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
[✓] Chrome - develop for the web
[!] Android Studio (not installed)
[✓] VS Code (version x.x.x)
[✓] Connected device (1 available)
[✓] Network resources
```

**Nota**: O Android Studio marcado como `[!]` é normal se você só instalou as command-line tools.

---

## 🔧 Solução de Problemas Comuns

### Problema: "sdkmanager not found"
**Solução:**
1. Verifique se as variáveis de ambiente estão corretas
2. Reinicie o Prompt de Comando
3. Confirme a estrutura de pastas:
   ```
   C:\android-sdk\cmdline-tools\latest\bin\sdkmanager.bat
   ```

### Problema: "flutter not found"
**Solução:**
1. Verifique se `C:\flutter\bin` está no PATH
2. Reinicie o Prompt de Comando
3. Confirme que existe: `C:\flutter\bin\flutter.exe`

### Problema: Licenças não aceitas
**Solução:**
```cmd
# Execute novamente
flutter doctor --android-licenses
# Aceite todas as licenças digitando 'y'
```

### Problema: Java não encontrado
**Solução:**
1. Verifique se JAVA_HOME está configurado corretamente
2. Teste: `echo %JAVA_HOME%`
3. Teste: `java -version`

---

## 🎯 Próximos Passos

### 1. Criar seu primeiro projeto
```cmd
flutter create meu_primeiro_app
cd meu_primeiro_app
flutter run
```

### 2. Instalar um editor (opcional)
- **VS Code**: https://code.visualstudio.com/
- **Android Studio**: https://developer.android.com/studio

### 3. Configurar dispositivo/emulador
- **Dispositivo físico**: Ativar "Depuração USB"
- **Emulador**: Instalar através do Android Studio

---

## 📝 Comandos de Verificação Rápida

```cmd
# Verificar versões
java -version
flutter --version
sdkmanager --version

# Verificar configuração
flutter doctor
flutter doctor -v

# Listar dispositivos
flutter devices

# Verificar caminhos
echo %JAVA_HOME%
echo %ANDROID_HOME%
echo %PATH%
```

---

## ✨ Dicas Extras

### Otimização de Performance
```cmd
# Habilitar compilação paralela
flutter config --enable-web
flutter config --no-analytics
```

### Limpeza de Cache (se necessário)
```cmd
flutter clean
flutter pub get
```

### Atualização do Flutter
```cmd
flutter upgrade
```

---

## 🎉 Conclusão

Se todos os passos foram seguidos corretamente, você deve ter:
- ✅ Java JDK instalado e configurado
- ✅ Flutter SDK instalado e configurado
- ✅ Android Command Line Tools instalados
- ✅ Variáveis de ambiente configuradas
- ✅ Licenças do Android aceitas
- ✅ `flutter doctor` mostrando tudo funcionando

Agora você está pronto para desenvolver aplicações Flutter! 🚀

**Próximo passo**: Criar seu primeiro projeto Flutter e testá-lo em um dispositivo ou emulador.