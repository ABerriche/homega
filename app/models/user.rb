class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :places, dependent: :destroy

  JOBS = ["Agriculteur exploitant", "Artisant commerçant", "Assistante maternelle", "Cadre", "Profession libérale", "Employé", "Enseignant", "Etudiant", "Ouvrier", "Retraité", "Sans activité professionnelle", "Autre"]
end
