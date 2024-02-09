using NbaManagement.Database;
using System.Collections.Generic;

namespace NbaManagement.Models
{
    public class TeamsByDivision
    {
        public Division Division { get; }

        public ICollection<Team> Teams { get; }

        public TeamsByDivision(Division division, ICollection<Team> teams)
        {
            Division = division;
            Teams = teams;
        }
    }
}