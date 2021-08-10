import React, { useContext }  from 'react';
import { AppContext } from '../context/AppContext';

const TotalExpense = () => {
	const { expenses } = useContext(AppContext);

	const totalExpenses = expenses.reduce((total, item) => {
	    total += item.cost
		return (total);
	}, 0);
	return (
		<div className='alert alert-primary'>
			<span>Spent so far: R{totalExpenses}</span>
		</div>
	);
};

export default TotalExpense;