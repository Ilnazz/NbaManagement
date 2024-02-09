using NbaManagement.Database;
using System.Collections.Generic;

namespace NbaManagement.Models
{
    public class TeamsByDivisionByConference
    {
        public Conference Conference { get; }

        public ICollection<TeamsByDivision> TeamsByDivisions { get; }

        public TeamsByDivisionByConference(Conference conference, ICollection<TeamsByDivision> teamsByDivisions)
        {
            Conference = conference;
            TeamsByDivisions = teamsByDivisions;
        }
    }
}