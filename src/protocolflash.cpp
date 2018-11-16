/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2015  Mark Samman <mark.samman@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include "otpch.h"

#include "protocolflash.h"
#include "configmanager.h"
#include "game.h"
#include "connection.h"
#include "networkmessage.h"
#include "outputmessage.h"
#include "tools.h"
#include "tasks.h"
#include "scheduler.h"

#include <fstream>
#include <sstream>
#include <iostream>

using namespace std;
void ProtocolFlash::onRecvFirstMessage(NetworkMessage& msg)
{
	(void)msg;
	return;
}

void ProtocolFlash::onConnect()
{
	auto output = OutputMessagePool::getOutputMessage();
	if (!output) {
		disconnect();
		return;
	}

	setRawMessages(true);

	ifstream in("data/XML/flash_policy.xml");
	std::stringstream buffer;
	buffer << in.rdbuf();
	in.close();

	std::string data = buffer.str();
	output->addBytes(data.c_str(), data.size());
	send(output);
	disconnect();
}
