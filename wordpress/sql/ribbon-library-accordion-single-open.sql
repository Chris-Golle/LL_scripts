UPDATE wp_posts
SET post_content = REPLACE(
  post_content,
  'document.querySelectorAll(\'.ll-cat-header\').forEach(function (btn) {\n    btn.addEventListener(\'click\', function () {\n      var activeTab = document.querySelector(\'.ll-tab.active\');\n      if (!activeTab || activeTab.dataset.cat !== \'all\') return;\n      var panel = this.nextElementSibling;\n      var open = this.getAttribute(\'aria-expanded\') === \'true\';\n      this.setAttribute(\'aria-expanded\', !open);\n      panel.classList.toggle(\'ll-acc-open\', !open);\n    });\n  });',
  'document.querySelectorAll(\'.ll-cat-header\').forEach(function (btn) {\n    btn.addEventListener(\'click\', function () {\n      var activeTab = document.querySelector(\'.ll-tab.active\');\n      if (!activeTab || activeTab.dataset.cat !== \'all\') return;\n      var panel = this.nextElementSibling;\n      var open = this.getAttribute(\'aria-expanded\') === \'true\';\n\n      document.querySelectorAll(\'.ll-cat-header\').forEach(function (otherBtn) {\n        if (otherBtn === btn) return;\n        otherBtn.setAttribute(\'aria-expanded\', \'false\');\n        var otherPanel = otherBtn.nextElementSibling;\n        if (otherPanel) otherPanel.classList.remove(\'ll-acc-open\');\n      });\n\n      this.setAttribute(\'aria-expanded\', !open);\n      panel.classList.toggle(\'ll-acc-open\', !open);\n    });\n  });'
)
WHERE ID = 7480;

DELETE FROM wp_options WHERE option_name LIKE '%transient%';
