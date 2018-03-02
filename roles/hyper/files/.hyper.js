module.exports = {
  config: {
    fontSize: 12,
    fontFamily: 'Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    shell: '/usr/local/bin/zsh',

    hyperTabs: {
      activityColor: '#888888',
      border: true,
      tabIconsColored: true,
      trafficButtons: true
    },

    overlay: {
      alwaysOnTop: true,
      animate: true,
      hasShadow: false,
      hideDock: true,
      hideOnBlur: true,
      hotkeys: ['Control+Space'],
      position: 'top',
      primaryDisplay: false,
      resizable: true,
      startAlone: false,
      startup: false,
      size: 0.8,
      tray: true,
      unique: false
    }
  },

  plugins: [
    'hyper-autohide-tabs',
    'hyper-seti-monokai',
    'hyper-tabs-enhanced',
    'hyperlinks',
    'hyperterm-overlay',
    'hyperterm-tabs'
  ],

  keymaps: {
  }
};
