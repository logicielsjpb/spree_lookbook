Deface::Override.new(
  virtual_path:  'spree/layouts/admin',
  name:          'lookbook_admin_sidebar_menu',
  insert_bottom: '#main-sidebar',
  partial:       'spree/admin/shared/lookbook_main_menu'
)
