class PrinciplePcpInteger < ActiveRecord::Migration
  def change
    add_column :patients, :principle_pcp_va_nonva, :integer
  end
end
